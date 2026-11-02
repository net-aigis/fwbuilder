#-*- mode: makefile; tab-width: 4; -*-
#
include(../../qmake.inc)
#
TEMPLATE = lib
#

SOURCES	 =  IOSCfgLexer.cpp  \
			IOSCfgParser.cpp \
			IPTCfgLexer.cpp  \
			IPTCfgParser.cpp \
			PIXCfgLexer.cpp  \
			PIXCfgParser.cpp \
			PFCfgLexer.cpp  \
			PFCfgParser.cpp \

HEADERS	 = ../../config.h    \
			IOSCfgLexer.hpp  \
			IOSCfgParser.hpp \
			IOSCfgParserTokenTypes.hpp \
			IPTCfgLexer.hpp  \
			IPTCfgParser.hpp \
			IPTCfgParserTokenTypes.hpp \
			PIXCfgLexer.hpp  \
			PIXCfgParser.hpp \
			PIXCfgParserTokenTypes.hpp \
			PFCfgLexer.hpp  \
			PFCfgParser.hpp \
			PFCfgParserTokenTypes.hpp \


CONFIG += staticlib

INCLUDEPATH += $$ANTLR_INCLUDEPATH ../import ../libfwbuilder/src
DEPENDPATH  += $$ANTLR_INCLUDEPATH ../import ../libfwbuilder/src

LIBS += $$ANTLR_LIBS
DEFINES += $$ANTLR_DEFINES

# MinGW g++ 16 can ICE at -O2 on the large ANTLR-generated *CfgParser.cpp files.
win32 {
    QMAKE_CXXFLAGS_RELEASE -= -O2
    QMAKE_CXXFLAGS_RELEASE += -O1
}

TARGET   = fwbparser

INSTALLS -= target
