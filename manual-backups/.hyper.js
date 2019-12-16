// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

const screenWidth = 2880;
const screenHeight = 1800;

module.exports = {

  config: {  // for advanced config flags please refer to https://hyper.is/#cfg
    backgroundColor: 'rgba(41, 44, 52, 1)',  // opacity supported only on Mac
    bell: false,  // "false" for no bell
    copyOnSelect: false,  // if "true", selected text will automatically be copied to the clipboard
    cursorBlink: true,  // (true/false)
    cursorColor: 'rgba(255, 255, 255, 1)',
    cursorShape: 'BEAM',  //  (BEAM|UNDERLINE|BLOCK)
    defaultSSHApp: true,  // if "true", hyper will be set as the default protocol client for SSH
    fontFamily: 'Inconsolata',
    fontSize: 32,  // default in pixels
    fontWeight: 'normal',  // (normal|bold)
    fontWeightBold: 'bold',  // (normal|bold)
    foregroundColor: 'rgba(171, 178, 190, 1)',  // text color
    opacity: 15/16,
    padding: `0px ${1 << 3}px`,
    quickEdit: false,
    scrollback: 1 << 10,  // The number of rows to be persisted in terminal buffer for scrolling
    selectionColor: `rgba(63, 68, 80, ${5/8})`,  // terminal selection color
    shell: '/usr/local/bin/bash',
    shellArgs: ['--login'],
    termCSS: '',  // custom CSS to embed in the terminal window
    updateChannel: 'stable',  // (stable|canary)

    colors: {
      black: 'rgba(0, 0, 0, 1)',
      blue: 'rgba(98, 175, 236, 1)',
      cyan: 'rgba(79, 181, 193, 1)',
      green: 'rgba(152, 194, 119, 1)',
      magenta: 'rgba(197, 121, 217, 1)',
      red: 'rgba(223, 108, 117, 1)',
      white: 'rgba(171, 178, 190, 1)',
      yellow: 'rgba(208, 154, 107, 1)',
      lightBlack: 'rgba(0, 0, 0, 1)',
      lightBlue: 'rgba(98, 175, 236, 1)',
      lightCyan: 'rgba(79, 181, 193, 1)',
      lightGreen: 'rgba(152, 194, 119, 1)',
      lightMagenta: 'rgba(197, 121, 217, 1)',
      lightRed: 'rgba(223, 108, 117, 1)',
      lightWhite: 'rgba(171, 178, 190, 1)',
      lightYellow: 'rgba(208, 154, 107, 1)',
    },

    env: {
      TERM: 'xterm-256color'
    },  // environment variables

    hypercwd: {
      initialWorkingDirectory: '~/',
    },

    hyperTabs: {
      activityColor: 'rgba(98, 175, 236, 1)',
      activityPulse: true,
      border: false,
      closeAlign: 'left',
      tabIconsColored: true,
      trafficButtons: true,
    },

    hyperWindowSize: {
      width:  screenWidth  / 2,
      height: screenHeight / 2,
      startX: 0,
      startY: 0,
    },
  },

  plugins: [
    'hyper-dark-scrollbar',
    'hyper-opacity',
    'hyper-quit',
    'hyper-search',
    'hyper-tabs-enhanced',
    'hyper-window-size',
    'hyperborder',
    'hypercwd',
  ],
};
