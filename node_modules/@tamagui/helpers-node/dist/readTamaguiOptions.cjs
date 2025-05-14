var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
    for (var name in all) __defProp(target, name, {
      get: all[name],
      enumerable: !0
    });
  },
  __copyProps = (to, from, except, desc) => {
    if (from && typeof from == "object" || typeof from == "function") for (let key of __getOwnPropNames(from)) !__hasOwnProp.call(to, key) && key !== except && __defProp(to, key, {
      get: () => from[key],
      enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable
    });
    return to;
  };
var __toCommonJS = mod => __copyProps(__defProp({}, "__esModule", {
  value: !0
}), mod);
var readTamaguiOptions_exports = {};
__export(readTamaguiOptions_exports, {
  readTamaguiOptions: () => readTamaguiOptions
});
module.exports = __toCommonJS(readTamaguiOptions_exports);
var import_node_path = require("node:path"),
  import_fs_extra = require("fs-extra"),
  import_getDefaultTamaguiOptions = require("./getDefaultTamaguiOptions.cjs");
async function readTamaguiOptions({
  cwd = "."
}) {
  const filePath = (0, import_node_path.join)(cwd, "tamagui.json");
  if (!(await (0, import_fs_extra.pathExists)(filePath))) return {
    exists: !1,
    options: await (0, import_getDefaultTamaguiOptions.getDefaultTamaguiOptions)({
      cwd
    })
  };
  try {
    const options = await (0, import_fs_extra.readJSON)(filePath);
    if (!Array.isArray(options.components)) throw new Error("Invalid components: not string[]");
    return {
      exists: !0,
      options: {
        ...(!options.config && (await (0, import_getDefaultTamaguiOptions.getDefaultTamaguiOptions)({
          cwd
        }))),
        ...options
      }
    };
  } catch (err) {
    return console.error(`Error reading tamagui.json: ${err.message} ${err.stack}`), {
      exists: !1,
      options: await (0, import_getDefaultTamaguiOptions.getDefaultTamaguiOptions)({
        cwd
      })
    };
  }
}