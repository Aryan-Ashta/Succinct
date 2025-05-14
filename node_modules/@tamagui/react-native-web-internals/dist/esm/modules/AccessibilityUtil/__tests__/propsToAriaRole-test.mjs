import propsToAriaRole from "../propsToAriaRole.mjs";
describe("modules/AccessibilityUtil/propsToAriaRole", () => {
  test("when missing accessibility props", () => {
    expect(propsToAriaRole({})).toBeUndefined();
  }), test('when "accessibilityRole" is defined', () => {
    expect(propsToAriaRole({
      accessibilityRole: "banner"
    })).toEqual("banner");
  }), test('when "accessibilityRole" is a native-only value', () => {
    expect(propsToAriaRole({
      accessibilityRole: "none"
    })).toEqual("presentation"), expect(propsToAriaRole({
      accessibilityRole: "imagebutton"
    })).toEqual(void 0), expect(propsToAriaRole({
      accessibilityRole: "label"
    })).toEqual(void 0);
  });
});
//# sourceMappingURL=propsToAriaRole-test.mjs.map
