#
# makefile generated by acslXtreme Version 3.0.1.6 on Tuesday, March 01, 2011 at 10:18:43 AM
#
MODEL = immune~1.csl
MODEL_XML = immune~1.xml
MODEL_AIL = immune~1.ail
MODEL_SRC = immune~1.cpp
MODEL_OBJ = immune~1.obj
MODEL_CSI = immune~1.csi
MODEL_DIR = C:\Users\paul\DOCUME~1\BiRG\Research\Modeling\acslX\IMMUNE~1
MODEL_ALT_SRC = immune~1.f90
TARGET = immune~1.dll
TARGET_FULL = "immune_system.dll"
MODEL_RRR_FULL = "immune_system.rrr"


#
# Compiler-specific settings.
#

TRANS = "C:\Program Files (x86)\AEgis Technologies\acslX\atrans.exe"
TRANSFLAGS = -lic_path "C:\Program Files (x86)\AEgis Technologies\acslX\license.dat;C:\Program Files (x86)\AEgis Technologies\acslX" -no_xsl -no_compile -no_link "$<"
XSLT = "C:\Program Files (x86)\AEgis Technologies\acslX\AcslXSLT.exe"
XSLTFLAGS = -IN "$<" -OUT "$@" -XSL "C:\Program Files (x86)\AEgis Technologies\acslX\ACSLIL2C.xsl" -TEXT
CPP = "C:\Program Files (x86)\AEgis Technologies\acslX\mingw32\bin\mingw32-gcc.exe"
CPPFLAGS = -c -I "C:\Program Files (x86)\AEgis Technologies\acslX" -o "$@" "$<" 
FORTRAN = "C:\Program Files (x86)\AEgis Technologies\acslX\mingw32\bin\mingw32-gcc.exe"
FORTRANFLAGS = -c -o "$@" "$<" 
LINK = "C:\Program Files (x86)\AEgis Technologies\acslX\mingw32\bin\mingw32-gcc.exe"
LINKFLAGS = -shared -Wl,-dll "C:\Program Files (x86)\AEgis Technologies\acslX\acsltrans.def" -o "$@" "$<"
STDLIBS = "C:\Program Files (x86)\AEgis Technologies\acslX\libacsl.a" -lstdc++ -lg2c

#
# Standard rules
#

.PHONY: default clean all

default: $(TARGET)

all : $(TARGET)

$(MODEL_AIL) : $(MODEL_DIR)\$(MODEL)
	@echo ##### Translating Model (CSL/GMX)...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(TRANS) $(TRANSFLAGS)
	move "$(MODEL_DIR)\$(MODEL_XML)" ".\$(MODEL_AIL)"
	move "$(MODEL_DIR)\$(MODEL_CSI)" .

%.cpp: %.ail
	@echo ##### Translating AIL...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(XSLT) $(XSLTFLAGS)

%.f90: %.ail
	@echo ##### Translating AIL...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(XSLT) $(XSLTFLAGS)

%.obj: %.f
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.F
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.for
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.FOR
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.f77
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.F77
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.f90
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.F90
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(FORTRAN) $(FORTRANFLAGS)

%.obj: %.cpp
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(CPP) $(CPPFLAGS)

%.obj: %.CPP
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(CPP) $(CPPFLAGS)

%.obj: %.c
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(CPP) $(CPPFLAGS)

%.obj: %.C
	@echo ##### Compiling...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(CPP) $(CPPFLAGS)

$(MODEL_SRC) : $(MODEL_AIL)

$(MODEL_OBJ) : $(MODEL_SRC)


#
# Project rules
#

$(TARGET) : $(MODEL_OBJ)
	@echo ##### Linking simulation DLL...
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe
	$(LINK) $(LINKFLAGS)  $(STDLIBS)
	rename $(TARGET) $(TARGET_FULL)
	C:\Program Files (x86)\AEgis Technologies\acslX\ShSysTime.exe

clean :
	del $(TARGET_FULL) "$(MODEL_OBJ)" "$(MODEL_CSI)" "$(MODEL_SRC)" "$(MODEL_ALT_SRC)" "$(MODEL_AIL)" $(MODEL_RRR_FULL) "immune~1.exp" "immune~1.lib" "consoleError.log" "consoleStatus.log"
