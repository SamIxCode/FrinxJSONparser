# JSON Config Parser

This script is used to parse a json configuration file and store the data in a PostgreSQL database. The script uses the SQLAlchemy library to interact with the database and the json library to parse the json file.

## Features
- Reads a json file and extracts specific data using a json path

- Creates objects for each interface in the json file

- Inserts the interface objects into a PostgreSQL database table

- Queries the database to check for interfaces that are part of a port-channel and updates the related interfaces

- Deletes all entries in the database table

## Requirements
- Python 3.x 
- SQLAlchemy 
- pandas
- PostgreSQL
## Usage
- Clone the repository
- Install the required libraries: pip install -r requirements.txt
- Update the settings in the db.py file to match your PostgreSQL database
- Update the json path in the __main__ block of the config_handler.py file to match the path of the interfaces in your json file
- Run the script: `python main.py`

## Code Overview

### main.py:

- __init__ function: Initializes the ConfigHandler class and creates an empty list to store interface objects
- read_json_file function: Reads the json file and extracts the interfaces data using the json path provided
- create_interface_objects function: Creates objects for each interface in the json file and appends them to the interfaces_objects list
- delete_all function: Deletes all entries in the interface_conf table
- commit_interfaces function: Inserts the interface objects into the interface_conf table
- check_portchannel function: Queries the database to check for interfaces that are part of a port-channel and updates the related interfaces
### db.py:

- get_engine function: Creates a connection to the PostgreSQL database using the settings provided
- get_session function: Returns a session object to interact with the database
- Interface class: Defines the interface_conf table and its columns

**Note: The json path to the interfaces must be manually inputed in the __main__ block of the config_handler.py file.**
