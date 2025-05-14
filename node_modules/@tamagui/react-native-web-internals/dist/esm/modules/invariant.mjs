function invariant(condition, log, ...logVars) {
  if (!condition) throw new Error(process.env.NODE_ENV === "development" ? log.split("%s").flatMap((chunk, i) => [chunk, logVars[i]]).join("") : log);
}
function warning(condition, log, ...logVars) {
  if (process.env.NODE_ENV === "development") try {
    invariant(condition, log, ...logVars);
  } catch (err) {
    console.warn(err);
  }
}
export { invariant, warning };
//# sourceMappingURL=invariant.mjs.map
