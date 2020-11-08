%hook AVCaptureDeviceFormat
- (float)minSimulatedAperture {
	return 1.4;
}
- (float)defaultSimulatedAperture {
	return 4.5;
}
- (float)maxSimulatedAperture {
	return 16;
}
- (float)minPortraitLightingEffectStrength {
	return 0;
}
- (float)defaultPortraitLightingEffectStrength {
	return 50;
}
- (float)maxPortraitLightingEffectStrength {
	return 100;
}
%end

%hook CAMCaptureCapabilities
- (bool)arePortraitEffectsSupported {
	return YES;
}
- (bool)isLivePreviewSupportedForLightingType:(long long)arg1 devicePosition:(long long)arg2 {
	arg1 = 1;
	return YES;
}
-(long long)supportedPortraitLightingVersion {
	return 2;
}
- (bool)isDepthEffectApertureSupported {
	return YES;
}
- (bool)isPortraitEffectIntensitySupported {
	return YES;
}
- (bool)_backStageLightPortaitEffectsSupported {
	return YES;
}
%end

%hook PUPhotoEditPortraitToolController
- (bool)canResetToDefaultValue {
	return YES;
}
- (bool)_canRenderPortraitEffect {
	return YES;
}
%end

%hook PUPhotoEditProtoSettings
- (bool)alwaysShowPortraitV2 {
	return YES;
}
%end

%ctor {
	%init;
}
