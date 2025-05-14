import * as React from "react";
import { mergeRefs } from "../mergeRefs/index.mjs";
function useMergeRefs(...args) {
  return React.useMemo(() => mergeRefs(...args),
  // eslint-disable-next-line
  [...args]);
}
export { useMergeRefs };
//# sourceMappingURL=index.mjs.map
