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

# MinGW g++ 16 ICEs (segfault) optimizing ANTLR *Cfg{Lexer,Parser}.cpp when
# they pull IPTImporter → ObjectSignature/Dispatch. Keep these files at -O0.
win32 {
    QMAKE_CXXFLAGS_RELEASE -= -O2 -O1
    QMAKE_CXXFLAGS_RELEASE += -O0
    QMAKE_CXXFLAGS += -O0 -fno-var-tracking-assignments
}

TARGET   = fwbparser

INSTALLS -= target
