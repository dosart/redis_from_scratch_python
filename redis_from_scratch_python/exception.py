from collections import namedtuple

Error = namedtuple("Error", ("message",))


class CommandError(Exception):
    def __init__(self, message):
        self.message = message
        super(CommandError, self).__init__()


class Disconnect(Exception):
    pass


class ServerError(Exception):
    pass


class ServerDisconnect(ServerError):
    pass
