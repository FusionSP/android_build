# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_FORCE_FFAST_MATH :=  \
	libskia \
	libGLESv2 \
	libEGL \
	libGLESv1_CM \
	libGLES_android \
	skia_skia_gyp \
	skia_skia_library_gyp \
	ui_gfx_gfx_gyp \
	ui_gfx_ipc_gfx_ipc_gyp \
	ui_gl_gl_gyp \
	libui \
	libgui \
	third_party_WebKit_Source_core_webcore_rendering_gyp \
	third_party_WebKit_Source_core_webcore_svg_gyp \
	third_party_WebKit_Source_core_webcore_generated_gyp \
	third_party_WebKit_Source_core_webcore_html_gyp \
	third_party_WebKit_Source_core_webcore_remaining_gy \
	third_party_WebKit_Source_web_blink_web_gyp \
	gpu_gl_in_process_context \
	ui_base_ui_base_gyp \
	ui_gfx_gfx_geometry_gyp \
	ui_shell_dialogs_shell_dialogs_gyp \
	gpu_gpu_ipc_gyp \
	gpu_gles2_c_lib_gyp \
	gpu_gles2_implementation_gyp \
	gpu_gl_in_process_context_gyp \
	gpu_skia_bindings_gpu_skia_bindings_gyp \
	libfilterfw_jni \
	libfilterfw_native \
	cc_cc_gyp

LOCAL_DISABLE_SINGLE_PRECISION := \

#############################################################################################################################
# Disabled:
#
#        libandroid_runtime \
#############################################################################################################################
# Experimental:
#
#        libstagefright_color_conversion \
#        libstagefright_aacenc \
#        libstagefright_soft_h264dec
#        libstagefright_matroska \
#        libstagefright_webm \
#        libstagefright_timedtext \
#        libvpx \
#        libwebm \
#        libstagefright_mpeg2ts \
#        libstagefright_id3 \
#        libFLAC \
#        libmedia_helper
#        skia_skia_gyp
#        gfx_gfx_gyp \
#        ui_gfx_gfx_geometry_gyp \
#        ui_gfx_ipc_gfx_ipc_gyp
#        libfilterfw_native \
#        libpixelflinger \
#        third_party_WebKit_Source_core_webcore_html_gyp -- this modules builds shadow among others need deeper look into the
#############################################################################################################################

ifneq ($(filter $(LOCAL_FORCE_FFAST_MATH), $(LOCAL_MODULE)),)
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += -ffast-math -ftree-vectorize
else
LOCAL_CONLYFLAGS := -ffast-math -ftree-vectorize
endif

ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS +=  -ffast-math -ftree-vectorize
else
LOCAL_CPPFLAGS :=  -ffast-math -ftree-vectorize
endif

### Some modules doesn't like forcing single precision, until we fix casting errors, let's disable this optimization
ifeq ($(filter $(LOCAL_DISABLE_SINGLE_PRECISION), $(LOCAL_MODULE)),)
LOCAL_CONLYFLAGS += -fsingle-precision-constant
LOCAL_CPPFLAGS   += -fsingle-precision-constant
endif
endif
#####
