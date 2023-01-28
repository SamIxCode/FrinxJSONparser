from sqlalchemy import create_engine, Column, Integer, DateTime, JSON, BOOLEAN, VARCHAR
from sqlalchemy.ext.declarative import declarative_base
from settings import postgresql as settings
from sqlalchemy.orm import sessionmaker

Base = declarative_base()


class Interface(Base):
    __tablename__ = "interface_conf"
    """ this is adjusted for the developemnt databse that i used that should be similar to the porduction one."""
    id = Column(Integer, primary_key=True, nullable=False)
    connection = Column(Integer)
    name = Column(VARCHAR(255), nullable=False)
    description = Column(VARCHAR(255))
    config = Column(JSON)
    type = Column(VARCHAR(50))
    infra_type = Column(VARCHAR(50))
    port_channel_id = Column(Integer)
    max_frame_size = Column(Integer)


def get_engine(user, host, port, db):
    url = f"postgresql://{user}@{host}:{port}/{db}"
    engine = create_engine(url, echo=False)
    return engine


engine = get_engine(
    settings["pguser"], settings["pghost"], settings["pgport"], settings["pgdb"]
)


def get_session():
    session = sessionmaker(bind=engine)()
    return session

