const { query } = await Service.import("applications")

const WINDOW_NAME = "calculator"

export const Calculator = Widget.Window({
  name: WINDOW_NAME,
  setup: self => self.keybind("Escape", () => {
    App.closeWindow(WINDOW_NAME)
  }),

  visible: false,
  keymode: "exclusive",


})
