import { validate } from "../validate.mjs";
describe("validate", () => {
  beforeAll(() => {
    jest.spyOn(console, "error").mockImplementation(() => {});
  }), afterAll(() => {
    console.error.mockRestore();
  }), afterEach(() => {
    console.error.mockClear();
  }), test("invalid shortform properties", () => {
    validate({
      background: "red"
    }), validate({
      font: "arial"
    }), validate({
      borderTop: "1px solid red"
    }), expect(console.error).toHaveBeenCalled();
  }), test("valid shortform values", () => {
    validate({
      flex: 1
    }), validate({
      margin: 10
    }), validate({
      margin: "calc(10 * 1px)"
    }), validate({
      margin: "calc(10 * calc(10 * 1px))"
    }), expect(console.error).not.toHaveBeenCalled();
  }), test("invalid shortform multi-values", () => {
    validate({
      flex: "1 1 25%"
    }), validate({
      margin: "10px 20px"
    }), validate({
      margin: "calc(10 * 1px) var(--test)"
    }), expect(console.error).toHaveBeenCalledTimes(3);
  });
});
//# sourceMappingURL=validate-test.mjs.map
