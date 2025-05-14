import { PackageJson } from 'type-fest';
export declare class Package {
    /** Absolute path to package */
    path: string;
    /** Absolute path to workspace.*/
    pathWorkspace: string;
    /** Absolute path to package.json. */
    pathPackageJson: string;
    packageJson: PackageJson;
    packageJsonEndsInNewline: boolean;
    pnpmWorkspacePackages?: readonly string[];
    constructor(path: string, pathWorkspace: string);
    get name(): string;
    /** Relative to workspace root. */
    get pathRelative(): string;
    get workspacePatterns(): readonly string[];
    static exists(path: string): boolean;
    static some(packages: readonly Package[], callback: (package_: Package) => boolean): boolean;
    static comparator(package1: Package, package2: Package): number;
}
