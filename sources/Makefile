OTX = theotxserver

INCLUDEDIRS = -I"." -I"/usr/include/lua5.1" -I"/usr/include/mysql" -I"/usr/include/libxml2"

FLAGS = -DBOOST_DISABLE_ASSERTS -DNDEBUG

CXXFLAGS = -march=native -mtune=native $(INCLUDEDIRS) $(FLAGS) -Werror -Wall -Ofast -ggdb3 -std=c++11 -pthread -lpthread -fno-strict-aliasing
CXX = g++

LIBS = -llua5.1 -lgmp -lboost_thread -lboost_system -lmysqlclient -lxml2 -lboost_regex -lboost_filesystem -lcrypto

LDFLAGS = $(LIBS)

CXXSOURCES = actions.cpp        cylinder.cpp     inputbox.cpp        monster.cpp         protocol.cpp       status.cpp \
	admin.cpp          database.cpp  databasemanager.cpp   ioban.cpp           monsters.cpp        protocolgame.cpp   talkaction.cpp \
	allocator.cpp      depot.cpp        ioguild.cpp         movement.cpp        protocolhttp.cpp   teleport.cpp \
	baseevents.cpp     dispatcher.cpp   iologindata.cpp     networkmessage.cpp  protocollogin.cpp  textlogger.cpp \
	beds.cpp           exception.cpp    iomap.cpp           npc.cpp             protocolold.cpp    thing.cpp \
	chat.cpp           fileloader.cpp   iomapserialize.cpp  otpch.cpp           quests.cpp         tile.cpp \
	combat.cpp         game.cpp         itemattributes.cpp  otserv.cpp          raids.cpp          tools.cpp \
	condition.cpp      gameservers.cpp  item.cpp            outfit.cpp          scheduler.cpp      trashholder.cpp \
	configmanager.cpp  globalevent.cpp  items.cpp           outputmessage.cpp   scriptmanager.cpp  vocation.cpp \
	connection.cpp     group.cpp        luascript.cpp       party.cpp           server.cpp         waitlist.cpp \
	container.cpp      gui.cpp          mailbox.cpp         playerbox.cpp       spawn.cpp          weapons.cpp \
	creature.cpp       house.cpp        manager.cpp         player.cpp          spectators.cpp \
	creatureevent.cpp  housetile.cpp    map.cpp             position.cpp        spells.cpp rsa.cpp

OBJDIR = obj
CXXOBJECTS = $(CXXSOURCES:%.cpp=$(OBJDIR)/%.o)

all: $(OTX)

clean:
	$(RM) $(CXXOBJECTS) $(OTX)

$(OTX): $(CXXOBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(CXXOBJECTS) $(LDFLAGS)

$(OBJDIR)/%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

