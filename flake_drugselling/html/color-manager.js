// Color Manager - applies UI color from config at runtime
// No default color set here — color comes from Config.UIcolor via NUI message
(function() {
    'use strict';

    function hexToRgb(hex) {
        hex = hex.replace('#', '');
        return {
            r: parseInt(hex.substring(0, 2), 16),
            g: parseInt(hex.substring(2, 4), 16),
            b: parseInt(hex.substring(4, 6), 16)
        };
    }

    function darkenColor(hex, percent) {
        percent = percent || 15;
        var rgb = hexToRgb(hex);
        var r = Math.max(0, Math.floor(rgb.r * (1 - percent / 100)));
        var g = Math.max(0, Math.floor(rgb.g * (1 - percent / 100)));
        var b = Math.max(0, Math.floor(rgb.b * (1 - percent / 100)));
        return '#' + [r, g, b].map(function(x) {
            var h = x.toString(16);
            return h.length === 1 ? '0' + h : h;
        }).join('');
    }

    window.applyUIColor = function(hexColor) {
        if (!hexColor || typeof hexColor !== 'string') return;
        if (!hexColor.startsWith('#')) hexColor = '#' + hexColor;
        if (!/^#[0-9A-F]{6}$/i.test(hexColor)) return;

        var rgb = hexToRgb(hexColor);
        var secondary = darkenColor(hexColor, 20);
        var root = document.documentElement;

        root.style.setProperty('--ui-color-primary', hexColor);
        root.style.setProperty('--ui-color-secondary', secondary);
        root.style.setProperty('--ui-color-rgb', rgb.r + ', ' + rgb.g + ', ' + rgb.b);
    };

})();