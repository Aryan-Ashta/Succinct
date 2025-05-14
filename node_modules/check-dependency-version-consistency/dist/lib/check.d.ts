import { Dependencies, Options } from './types.js';
/**
 * Checks for inconsistencies across a workspace. Optionally fixes them.
 * @param path - path to the workspace root
 * @param options
 * @param options.depType - Dependency type(s) to check
 * @param options.fix - Whether to autofix inconsistencies (using latest version present)
 * @param options.ignoreDep - Dependency(s) to ignore mismatches for
 * @param options.ignoreDepPattern - RegExp(s) of dependency names to ignore mismatches for
 * @param options.ignorePackage - Workspace package(s) to ignore mismatches for
 * @param options.ignorePackagePattern - RegExp(s) of package names to ignore mismatches for
 * @param options.ignorePath - Workspace-relative path(s) of packages to ignore mismatches for
 * @param options.ignorePathPattern - RegExp(s) of workspace-relative path of packages to ignore mismatches for
 * @returns an object with the following properties:
 * - `dependencies`: An object mapping each dependency in the workspace to information about it including the versions found of it.
 */
export declare function check(path: string, options?: Options): {
    dependencies: Dependencies;
};
