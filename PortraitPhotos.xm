/* Portrait Photos - Enable all Portrait Lighting effects in Camera app and Photos app on iOS/iPadOS
 * Copyright (C) 2020 Tomasz Poliszuk
 *
 * Portrait Photos is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Portrait Photos is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Portrait Photos. If not, see <https://www.gnu.org/licenses/>.
 */


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
