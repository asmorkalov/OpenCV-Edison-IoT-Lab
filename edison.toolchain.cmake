#Are you using the 32 or the 64 bits version of the SDK?.
set(SDK_32bits FALSE) #Use this line for the 64 bits SDK
#set(SDK_32bits TRUE) #Use this line for the 32 bits SDK

#You can change this to any absolute folder in your Edison
#This is the folder where the executable will be copied to.
set(deploymentFolderAbsolutPath /home/root)

#Set the target parameters
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_VERSION 3.10.17-poky-edison+)
set(CMAKE_SYSTEM_PROCESSOR i686)

#Set the host parameters
if(WIN32)
    #Windows host
	if(${SDK_32bits})
		#32 bit SDK
		set(edison_sdk_root C:/Edison/poky-edison-eglibc-i686-edison-image-core2-32-toolchain-1.7.2)
		set(cross_compiler_sysroot ${edison_sdk_root}/sysroots/i686-pokysdk-mingw32)
		#MinGW make
		set(CMAKE_MAKE_PROGRAM "C:/Program Files/mingw-w64/i686-4.9.2-posix-dwarf-rt_v3-rev1/mingw32/bin/mingw32-make.exe")
	else()
		#64 bit SDK
		set(edison_sdk_root C:/Edison/poky-edison-eglibc-x86_64-edison-image-core2-32-toolchain-1.7.2)
		set(cross_compiler_sysroot ${edison_sdk_root}/sysroots/x86_64-pokysdk-mingw32)
		#MinGW make
		set(CMAKE_MAKE_PROGRAM "C:/Program Files (x86)/mingw-w64/i686-4.9.2-posix-dwarf-rt_v3-rev1/mingw32/bin/mingw32-make.exe")
	endif()
	set(CMAKE_C_COMPILER ${cross_compiler_sysroot}/usr/bin/i586-poky-linux/i586-poky-linux-gcc.exe)
	set(CMAKE_CXX_COMPILER ${cross_compiler_sysroot}/usr/bin/i586-poky-linux/i586-poky-linux-g++.exe)
else()
	#Linux host
	if(${SDK_32bits})
		#32 bit SDK
		set(edison_sdk_root /opt/poky-edison/1.7.2)
		set(cross_compiler_sysroot ${edison_sdk_root}/sysroots/i686-pokysdk-linux)
	else()
		#64 bit SDK
		set(edison_sdk_root /opt/poky-edison/1.7.2)
		set(cross_compiler_sysroot ${edison_sdk_root}/sysroots/x86_64-pokysdk-linux)
	endif()
	set(CMAKE_C_COMPILER ${cross_compiler_sysroot}/usr/bin/i586-poky-linux/i586-poky-linux-gcc)
	set(CMAKE_CXX_COMPILER ${cross_compiler_sysroot}/usr/bin/i586-poky-linux/i586-poky-linux-g++)
ENDIF(WIN32)


set(CMAKE_SYSROOT ${edison_sdk_root}/sysroots/core2-32-poky-linux)
set(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

SET(CMAKE_C_FLAGS "-Os -g3 -Wall --sysroot=${CMAKE_SYSROOT} -m32 -march=i586 -ffunction-sections -fdata-sections"  CACHE STRING "" FORCE)
SET(CMAKE_CXX_FLAGS "-Os -g3 -Wall --sysroot=${CMAKE_SYSROOT} -m32 -march=i586 -ffunction-sections -fdata-sections"  CACHE STRING "" FORCE)

INCLUDE_DIRECTORIES(${CMAKE_SYSROOT}/usr/include)
INCLUDE_DIRECTORIES(${CMAKE_SYSROOT}/usr/include/c++)
INCLUDE_DIRECTORIES(${CMAKE_SYSROOT}/usr/include/c++/i586-poky-linux)


#This is for telling Qt to deploy files
file(WRITE "${CMAKE_SOURCE_DIR}/QtCreatorDeployment.txt" "/\n")
macro(add_deployment_file SRC DEST)
	file(RELATIVE_PATH path ${CMAKE_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
	file(APPEND "${CMAKE_SOURCE_DIR}/QtCreatorDeployment.txt" "${path}/${SRC}:${DEST}\n")
endmacro()
macro(add_deployment_directory SRC DEST)
	file(GLOB_RECURSE files RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "${SRC}/*")
	foreach(filename ${files})
		get_filename_component(path ${filename} PATH)
		add_deployment_file("${filename}" "${DEST}/${path}")
	endforeach(filename)
endmacro()
