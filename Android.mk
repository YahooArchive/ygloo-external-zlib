LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ZLIB_SRC_FILES := \
	adler32.c \
	compress.c \
	crc32.c \
	deflate.c \
	gzclose.c \
	gzlib.c \
	gzread.c \
	gzwrite.c \
	infback.c \
	inflate.c \
	inftrees.c \
	inffast.c \
	trees.c \
	uncompr.c \
	zutil.c

include $(CLEAR_VARS)

LOCAL_MODULE := libyahoo_zlib
LOCAL_MODULE_TAGS := optional
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS += -O3 -DUSE_MMAP -DZ_HAVE_UNISTD_H=1
LOCAL_CFLAGS += -Werror
LOCAL_SRC_FILES := $(ZLIB_SRC_FILES)
ifeq ($(TARGET_ARCH),arm)
  LOCAL_NDK_VERSION := 5
  LOCAL_SDK_VERSION := 9
endif

# Force compiling the static library as PIC so it can be embedded
# into a shared library later
LOCAL_CFLAGS += -fPIC -DPIC

include $(BUILD_STATIC_LIBRARY)
