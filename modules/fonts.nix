{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    (iosevka.override {
      privateBuildPlan = ''
        [buildPlans.iosevka-custom]
        family = "Iosevka Custom"
        spacing = "normal"
        serifs = "sans"
        noCvSs = true
        exportGlyphNames = false

          [buildPlans.iosevka-custom.variants]
          inherits = "ss09"

            [buildPlans.iosevka-custom.variants.design]
            one = "line"
            seven = "bend-serifless-crossbar"
            zero = "tall-slashed"
            capital-u = "toothed-bottom-right-serifed"
            capital-z = "straight-serifless-with-horizontal-crossbar"
            a = "single-storey-earless-corner-tailed"
            b = "toothless-rounded-serifless"
            d = "toothless-corner-serifless"
            f = "flat-hook-tailed-crossbar-at-x-height"
            g = "single-storey-serifless"
            i = "flat-tailed"
            j = "flat-hook-serifless"
            k = "diagonal-tailed-cursive-serifless"
            l = "flat-tailed"
            r = "serifless"
            s = "serifless"
            t = "bent-hook-short-neck"
            v = "straight-serifless"
            x = "straight-bilateral-motion-serifed"
            y = "cursive-flat-hook-serifless"
            z = "curly-serifless"
            punctuation-dot = "round"
            braille-dot = "round"
            tilde = "low"
            asterisk = "hex-mid"
            underscore = "low"
            caret = "high"
            brace = "straight"
            guillemet = "straight"
            number-sign = "slanted"
            ampersand = "et-tailed"
            at = "fourfold-solid-inner"
            dollar = "open-cap"
            cent = "through-cap"
            percent = "rings-continuous-slash"
            bar = "force-upright"
            question = "corner"
            pilcrow = "low"
            micro-sign = "tailed-serifed"
            decorative-angle-brackets = "short"
            lig-ltgteq = "flat"
            lig-neq = "slightly-slanted"
            lig-equal-chain = "without-notch"
            lig-hyphen-chain = "without-notch"
            lig-plus-chain = "without-notch"
            lig-double-arrow-bar = "without-notch"
            lig-single-arrow-bar = "without-notch"

            [buildPlans.iosevka-custom.variants.italic]
            one = "line"
            seven = "bend-serifless-crossbar"
            zero = "tall-slashed"
            capital-u = "toothed-bottom-right-serifed"
            capital-z = "straight-serifless-with-horizontal-crossbar"
            a = "single-storey-earless-corner-tailed"
            b = "toothless-rounded-serifless"
            d = "toothless-corner-serifless"
            f = "flat-hook-tailed-crossbar-at-x-height"
            g = "single-storey-serifless"
            i = "flat-tailed"
            j = "flat-hook-serifless"
            k = "diagonal-tailed-cursive-serifless"
            l = "flat-tailed"
            r = "serifless"
            s = "serifless"
            t = "bent-hook-short-neck"
            v = "straight-serifless"
            x = "straight-bilateral-motion-serifed"
            y = "cursive-flat-hook-serifless"
            z = "curly-serifless"
            punctuation-dot = "round"
            braille-dot = "round"
            tilde = "low"
            asterisk = "hex-mid"
            underscore = "low"
            caret = "high"
            brace = "straight"
            guillemet = "straight"
            number-sign = "slanted"
            ampersand = "et-tailed"
            at = "fourfold-solid-inner"
            dollar = "open-cap"
            cent = "through-cap"
            percent = "rings-continuous-slash"
            bar = "force-upright"
            question = "corner"
            pilcrow = "low"
            micro-sign = "tailed-serifed"
            decorative-angle-brackets = "short"
            lig-ltgteq = "flat"
            lig-neq = "slightly-slanted"
            lig-equal-chain = "without-notch"
            lig-hyphen-chain = "without-notch"
            lig-plus-chain = "without-notch"
            lig-double-arrow-bar = "without-notch"
            lig-single-arrow-bar = "without-notch"

            [buildPlans.iosevka-custom.variants.oblique]
            one = "line"
            seven = "bend-serifless-crossbar"
            zero = "tall-slashed"
            capital-u = "toothed-bottom-right-serifed"
            capital-z = "straight-serifless-with-horizontal-crossbar"
            a = "single-storey-earless-corner-tailed"
            b = "toothless-rounded-serifless"
            d = "toothless-corner-serifless"
            f = "flat-hook-tailed-crossbar-at-x-height"
            g = "single-storey-serifless"
            i = "flat-tailed"
            j = "flat-hook-serifless"
            k = "diagonal-tailed-cursive-serifless"
            l = "flat-tailed"
            r = "serifless"
            s = "serifless"
            t = "bent-hook-short-neck"
            v = "straight-serifless"
            x = "straight-bilateral-motion-serifed"
            y = "cursive-flat-hook-serifless"
            z = "curly-serifless"
            punctuation-dot = "round"
            braille-dot = "round"
            tilde = "low"
            asterisk = "hex-mid"
            underscore = "low"
            caret = "high"
            brace = "straight"
            guillemet = "straight"
            number-sign = "slanted"
            ampersand = "et-tailed"
            at = "fourfold-solid-inner"
            dollar = "open-cap"
            cent = "through-cap"
            percent = "rings-continuous-slash"
            bar = "force-upright"
            question = "corner"
            pilcrow = "low"
            micro-sign = "tailed-serifed"
            decorative-angle-brackets = "short"
            lig-ltgteq = "flat"
            lig-neq = "slightly-slanted"
            lig-equal-chain = "without-notch"
            lig-hyphen-chain = "without-notch"
            lig-plus-chain = "without-notch"
            lig-double-arrow-bar = "without-notch"
            lig-single-arrow-bar = "without-notch"

          [buildPlans.iosevka-custom.ligations]
          inherits = "dlig"

        [buildPlans.iosevka-custom.weights.Regular]
        shape = 400
        menu = 400
        css = 400

        [buildPlans.iosevka-custom.weights.Bold]
        shape = 700
        menu = 700
        css = 700

        [buildPlans.iosevka-custom.slopes.Upright]
        angle = 0
        shape = "upright"
        menu = "upright"
        css = "normal"

        [buildPlans.iosevka-custom.slopes.Italic]
        angle = 9.4
        shape = "italic"
        menu = "italic"
        css = "italic"
      '';
      set = "iosevka-custom";
    })

    cascadia-code
    fira-mono
    victor-mono
    source-code-pro
    jetbrains-mono
    iosevka
    pkgs.iosevka-comfy.comfy
  ];

  fonts.enableDefaultPackages = true;
}
