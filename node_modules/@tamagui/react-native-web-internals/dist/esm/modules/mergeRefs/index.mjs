function mergeRefs(...args) {
  return function (node) {
    args.forEach(ref => {
      if (ref != null) {
        if (typeof ref == "function") {
          ref(node);
          return;
        }
        if (typeof ref == "object") {
          ref.current = node;
          return;
        }
        console.error(`mergeRefs cannot handle Refs of type boolean, number or string, received ref ${String(ref)}`);
      }
    });
  };
}
export { mergeRefs };
//# sourceMappingURL=index.mjs.map
