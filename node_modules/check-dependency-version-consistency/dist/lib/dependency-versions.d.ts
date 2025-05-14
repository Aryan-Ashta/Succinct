import { Package } from './package.js';
import { DEPENDENCY_TYPE } from './types.js';
type DependenciesToVersionsSeen = Map<string, {
    package: Package;
    version: string;
    isLocalPackageVersion: boolean;
}[]>;
/** A dependency, the versions present of it, and the packages each of those versions are seen in. */
type DependencyAndVersions = {
    dependency: string;
    readonly versions: {
        version: string;
        packages: readonly Package[];
    }[];
};
/**
 * Creates a map of each dependency in the workspace to an array of the packages it is used in.
 *
 * Example of such a map represented as an object:
 *
 * {
 *  'ember-cli': [
 *     { package: Package...'@scope/package1', version: '~3.18.0' },
 *     { package: Package...'@scope/package2', version: '~3.18.0' }
 *  ]
 *  'eslint': [
 *     { package: Package...'@scope/package1', version: '^7.0.0' },
 *     { package: Package...'@scope/package2', version: '^7.0.0' }
 *  ]
 * }
 */
export declare function calculateVersionsForEachDependency(packages: readonly Package[], depType?: readonly DEPENDENCY_TYPE[]): DependenciesToVersionsSeen;
export declare function calculateDependenciesAndVersions(dependencyVersions: DependenciesToVersionsSeen): readonly DependencyAndVersions[];
export declare function filterOutIgnoredDependencies(mismatchingVersions: readonly DependencyAndVersions[], ignoredDependencies: readonly string[], ignoredDependencyPatterns: readonly RegExp[]): readonly DependencyAndVersions[];
export declare function fixVersionsMismatching(packages: readonly Package[], mismatchingVersions: readonly DependencyAndVersions[], dryrun?: boolean): {
    fixable: readonly DependencyAndVersions[];
    notFixable: readonly DependencyAndVersions[];
};
export {};
