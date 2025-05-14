import { Dependencies } from './types.js';
/**
 * Returns human-readable tables describing mismatching dependency versions.
 */
export declare function dependenciesToMismatchSummary(dependencies: Dependencies): string;
/**
 * Returns a summary of the mismatching dependency versions that were fixed.
 */
export declare function dependenciesToFixedSummary(dependencies: Dependencies): string;
