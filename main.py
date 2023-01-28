import json
from db import get_session, Interface
from sqlalchemy import and_


class ConfigHandler:
    def __init__(self):
        self.session = get_session()
        self.interfaces_objects = []

    def read_json_file(self, file_path, json_path):
        with open(file_path, "r") as f:
            dictobj = json.load(f)

        # Extract the interfaces data - this path is manually selected
        interfaces = dictobj
        for path in json_path:
            interfaces = interfaces[path]
        return interfaces

    def create_interface_objects(self, interfaces):
        for name in interfaces:
            for i in interfaces[name]:
                interface = Interface(
                    name=name + str(i["name"]),
                    description=i.get("description", None),
                    config=i,
                )
                self.interfaces_objects.append(interface)
        return self.interfaces_objects

    def delete_all(self):
        self.session.query(Interface).delete()
        self.session.commit()
        return print("deleted all entries in table")

    def commit_interfaces(self):
        self.session.add_all(self.interfaces_objects)
        self.session.commit()
        return print("commit done")

    def check_portchannel(self):
        query = (
            self.session.query(Interface)
            .filter(
                Interface.config["Cisco-IOS-XE-ethernet:channel-group"]["number"]
                != None
            )
            .all()
        )
        if query:
            for interface in query:

                querry_port_channel = (
                    self.session.query(Interface)
                    .filter(
                        Interface.name.contains(
                            str(
                                "Port-channel"
                                + str(
                                    interface.config[
                                        "Cisco-IOS-XE-ethernet:channel-group"
                                    ]["number"]
                                )
                            )
                        )
                    )
                    .first()
                )
                interface.port_channel_id = querry_port_channel.id
                self.session.add(interface)
                self.session.commit()
        else:
            print("No child portchannels")


if __name__ == "__main__":

    config_handler = ConfigHandler()

    interfaces = config_handler.read_json_file(
        "configClear_v2.json",
        [
            "frinx-uniconfig-topology:configuration",
            "Cisco-IOS-XE-native:native",
            "interface",
        ],
    )

    config_handler.create_interface_objects(interfaces)
    config_handler.commit_interfaces()
    config_handler.check_portchannel()
    config_handler.delete_all()
