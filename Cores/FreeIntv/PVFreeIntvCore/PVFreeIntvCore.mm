//
//  PVFreeIntvCore.m
//  PVFreeIntv
//
//  Created by Joseph Mattiello on 6/15/22.
//  Copyright © 2022 Provenance. All rights reserved.
//

#import "PVFreeIntvCore.h"
#include <stdatomic.h>
//#import "PVFreeIntvCore+Controls.h"
//#import "PVFreeIntvCore+Audio.h"
//#import "PVFreeIntvCore+Video.h"
//
//#import "PVFreeIntvCore+Audio.h"

#import <Foundation/Foundation.h>
#import <PVSupport/PVSupport.h>

#define SAMPLERATE 48000
#define SIZESOUNDBUFFER 48000 / 60 * 4
#define OpenEmu 1

#pragma mark - Private
@interface PVFreeIntvCore() {

}

@end

#pragma mark - PVFreeIntvCore Begin

@implementation PVFreeIntvCore
{
}

- (instancetype)init {
	if (self = [super init]) {
	}

	_current = self;
	return self;
}

- (void)dealloc {
	_current = nil;
}

#pragma mark - PVEmulatorCore
//- (BOOL)loadFileAtPath:(NSString *)path error:(NSError**)error {
//	NSBundle *coreBundle = [NSBundle bundleForClass:[self class]];
//	const char *dataPath;
//
//    [self initControllBuffers];
//
//	// TODO: Proper path
//	NSString *configPath = self.saveStatesPath;
//	dataPath = [[coreBundle resourcePath] fileSystemRepresentation];
//
//	[[NSFileManager defaultManager] createDirectoryAtPath:configPath
//                              withIntermediateDirectories:YES
//                                               attributes:nil
//                                                    error:nil];
//
//	NSString *batterySavesDirectory = self.batterySavesPath;
//	[[NSFileManager defaultManager] createDirectoryAtPath:batterySavesDirectory
//                              withIntermediateDirectories:YES
//                                               attributes:nil
//                                                    error:NULL];
//
//    return YES;
//}

#pragma mark - Running
//- (void)startEmulation {
//	if (!_isInitialized)
//	{
//		[self.renderDelegate willRenderFrameOnAlternateThread];
//        _isInitialized = true;
//		_frameInterval = dol_host->GetFrameInterval();
//	}
//	[super startEmulation];
//
	//Disable the OE framelimiting
//	[self.renderDelegate suspendFPSLimiting];
//	if(!self.isRunning) {
//		[super startEmulation];
////        [NSThread detachNewThreadSelector:@selector(runReicastRenderThread) toTarget:self withObject:nil];
//	}
//}

//- (void)setPauseEmulation:(BOOL)flag {
//	[super setPauseEmulation:flag];
//}
//
//- (void)stopEmulation {
//	_isInitialized = false;
//
//	self->shouldStop = YES;
////	dispatch_semaphore_signal(mupenWaitToBeginFrameSemaphore);
////    dispatch_semaphore_wait(coreWaitForExitSemaphore, DISPATCH_TIME_FOREVER);
//	[self.frontBufferCondition lock];
//	[self.frontBufferCondition signal];
//	[self.frontBufferCondition unlock];
//
//	[super stopEmulation];
//}
//
//- (void)resetEmulation {
//	//	dispatch_semaphore_signal(mupenWaitToBeginFrameSemaphore);
//	[self.frontBufferCondition lock];
//	[self.frontBufferCondition signal];
//	[self.frontBufferCondition unlock];
//}

//# pragma mark - Cheats
//- (void)setCheat:(NSString *)code setType:(NSString *)type setEnabled:(BOOL)enabled {
//}
//
//- (BOOL)supportsRumble { return NO; }
//- (BOOL)supportsCheatCode { return NO; }

- (NSTimeInterval)frameInterval {
    return 60;
}

- (CGSize)aspectSize {
    return CGSizeMake(4, 3);
}

- (CGSize)bufferSize {
    return CGSizeMake(1024, 768);
}

- (GLenum)pixelFormat {
    return GL_RGB;
}

- (GLenum)pixelType {
    return GL_UNSIGNED_SHORT_5_6_5;
}

- (GLenum)internalPixelFormat {
    // TODO: use struct retro_pixel_format var, set with, RETRO_ENVIRONMENT_SET_PIXEL_FORMAT
    return GL_RGB565;
}


//- (GLenum)pixelFormat {
//    return GL_BGRA;
//}
//
//- (GLenum)pixelType {
//    return GL_UNSIGNED_BYTE;
//}
//
//- (GLenum)internalPixelFormat {
//    return GL_RGBA;
//}
# pragma mark - Audio

- (double)audioSampleRate {
    return 48000;
}

#if 0
const struct retro_variable vars[] = {
   { "FreeIntv_mode", "MSX Mode; MSX2+|MSX1|MSX2" },
   { "FreeIntv_video_mode", "MSX Video Mode; NTSC|PAL|Dynamic" },
   { "FreeIntv_hires", "Support high resolution; Off|Interlaced|Progressive" },
   { "FreeIntv_overscan", "Support overscan; No|Yes" },
   { "FreeIntv_mapper_type_mode", "MSX Mapper Type Mode; "
         "Guess|"
         "Generic 8kB|"
         "Generic 16kB|"
         "Konami5 8kB|"
         "Konami4 8kB|"
         "ASCII 8kB|"
         "ASCII 16kB|"
         "GameMaster2|"
         "FMPAC"
   },
   { "FreeIntv_ram_pages", "MSX Main Memory; Auto|64KB|128KB|256KB|512KB|4MB" },
   { "FreeIntv_vram_pages", "MSX Video Memory; Auto|32KB|64KB|128KB|192KB" },
   { "FreeIntv_log_level", "FreeIntv logging; Off|Info|Debug|Spam" },
   { "FreeIntv_game_master", "Support Game Master; No|Yes" },
   { "FreeIntv_simbdos", "Simulate DiskROM disk access calls; No|Yes" },
   { "FreeIntv_autospace", "Use autofire on SPACE; No|Yes" },
   { "FreeIntv_allsprites", "Show all sprites; No|Yes" },
   { "FreeIntv_font", "Text font; standard|DEFAULT.FNT|ITALIC.FNT|INTERNAT.FNT|CYRILLIC.FNT|KOREAN.FNT|JAPANESE.FNT" },
   { "FreeIntv_flush_disk", "Save disk changes; Never|Immediate|On close|To/From SRAM" },
   { "FreeIntv_phantom_disk", "Create empty disk when none loaded; No|Yes" },
   { "FreeIntv_custom_keyboard_up", up_value},
   { "FreeIntv_custom_keyboard_down", down_value},
   { "FreeIntv_custom_keyboard_left", left_value},
   { "FreeIntv_custom_keyboard_right", right_value},
   { "FreeIntv_custom_keyboard_a", a_value},
   { "FreeIntv_custom_keyboard_b", b_value},
   { "FreeIntv_custom_keyboard_y", y_value},
   { "FreeIntv_custom_keyboard_x", x_value},
   { "FreeIntv_custom_keyboard_start", start_value},
   { "FreeIntv_custom_keyboard_select", select_value},
   { "FreeIntv_custom_keyboard_l", l_value},
   { "FreeIntv_custom_keyboard_r", r_value},
   { "FreeIntv_custom_keyboard_l2", l2_value},
   { "FreeIntv_custom_keyboard_r2", r2_value},
   { "FreeIntv_custom_keyboard_l3", l3_value},
   { "FreeIntv_custom_keyboard_r3", r3_value},
   { NULL, NULL },
};
#endif

#pragma mark - Options
- (void *)getVariable:(const char *)variable {
    ILOG(@"%s", variable);
    
    
    #define V(x) strcmp(variable, x) == 0
    if (V("FreeIntv_video_mode")) {
        // NTSC|PAL|Dynamic
        char *value = strdup("Dynamic");
        return value;
    } else if (V("FreeIntv_mode")) {
            // MSX2+|MSX1|MSX2
            char * value = strdup("MSX2+");
            return value;
    } else if (V("FreeIntv_hires")) {
            // Off|Interlaced|Progressive
            char *value = strdup("Progressive");
            return value;
    } else if (V("FreeIntv_overscan")) {
            // No|Yes
            char *value = strdup("Yes");
            return value;
    } else if (V("FreeIntv_mapper_type_mode")) {
//        { "FreeIntv_mapper_type_mode", "MSX Mapper Type Mode; "
//              "Guess|"
//              "Generic 8kB|"
//              "Generic 16kB|"
//              "Konami5 8kB|"
//              "Konami4 8kB|"
//              "ASCII 8kB|"
//              "ASCII 16kB|"
//              "GameMaster2|"
//              "FMPAC"
//        },
            char *value = strdup("FMPAC");
            return value;
    } else {
        ELOG(@"Unprocessed var: %s", variable);
        return nil;
    }
    
#undef V
    return NULL;
}
@end