export declare function compareVersionRangesSafe(a: string, b: string): 0 | -1 | 1;
export declare function compareVersionRanges(a: string, b: string): 0 | -1 | 1;
export declare function compareRanges(aRange: string, bRange: string): 0 | -1 | 1;
export declare function versionRangeToRange(versionRange: string): string;
export declare function getLatestVersion(versions: readonly string[]): string;
export declare function getHighestRangeType(ranges: readonly string[]): string;
export declare function getIncreasedLatestVersion(versions: readonly string[]): string;
