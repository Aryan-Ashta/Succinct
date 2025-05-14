import { check } from './check.js';
import { dependenciesToFixedSummary, dependenciesToMismatchSummary, } from './output.js';
export class CDVC {
    /**
     * @param path - path to the workspace root
     * @param options
     * @param options.fix - Whether to autofix inconsistencies (using latest version present)
     * @param options.ignoreDep - Dependency(s) to ignore mismatches for
     * @param options.ignoreDepPattern - RegExp(s) of dependency names to ignore mismatches for
     * @param options.ignorePackage - Workspace package(s) to ignore mismatches for
     * @param options.ignorePackagePattern - RegExp(s) of package names to ignore mismatches for
     * @param options.ignorePath - Workspace-relative path(s) of packages to ignore mismatches for
     * @param options.ignorePathPattern - RegExp(s) of workspace-relative path of packages to ignore mismatches for
     */
    constructor(path, options) {
        const { dependencies } = check(path, options);
        this.dependencies = dependencies;
    }
    toMismatchSummary() {
        return dependenciesToMismatchSummary(this.dependencies);
    }
    toFixedSummary() {
        return dependenciesToFixedSummary(this.dependencies);
    }
    getDependencies() {
        return Object.keys(this.dependencies).map((dependency) => this.getDependency(dependency));
    }
    getDependency(name) {
        // Convert underlying dependency data object with relevant public data.
        return {
            name,
            isFixable: this.dependencies[name].isFixable,
            isMismatching: this.dependencies[name].isMismatching,
            versions: this.dependencies[name].versions.map((version) => ({
                version: version.version,
                packages: version.packages.map((package_) => ({
                    pathRelative: package_.pathRelative,
                })),
            })),
        };
    }
    get hasMismatchingDependencies() {
        return Object.values(this.dependencies).some((dep) => dep.isMismatching);
    }
    get hasMismatchingDependenciesFixable() {
        return Object.values(this.dependencies).some((dep) => dep.isMismatching && dep.isFixable);
    }
    get hasMismatchingDependenciesNotFixable() {
        return Object.values(this.dependencies).some((dep) => dep.isMismatching && !dep.isFixable);
    }
}
