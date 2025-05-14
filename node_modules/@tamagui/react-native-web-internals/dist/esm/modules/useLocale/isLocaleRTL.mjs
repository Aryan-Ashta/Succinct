const rtlScripts = /* @__PURE__ */new Set(["Arab", "Syrc", "Samr", "Mand", "Thaa", "Mend", "Nkoo", "Adlm", "Rohg", "Hebr"]),
  rtlLangs = /* @__PURE__ */new Set(["ae",
  // Avestan
  "ar",
  // Arabic
  "arc",
  // Aramaic
  "bcc",
  // Southern Balochi
  "bqi",
  // Bakthiari
  "ckb",
  // Sorani
  "dv",
  // Dhivehi
  "fa", "far",
  // Persian
  "glk",
  // Gilaki
  "he", "iw",
  // Hebrew
  "khw",
  // Khowar
  "ks",
  // Kashmiri
  "ku",
  // Kurdish
  "mzn",
  // Mazanderani
  "nqo",
  // N'Ko
  "pnb",
  // Western Punjabi
  "ps",
  // Pashto
  "sd",
  // Sindhi
  "ug",
  // Uyghur
  "ur",
  // Urdu
  "yi"
  // Yiddish
  ]),
  cache = /* @__PURE__ */new Map();
function isLocaleRTL(locale) {
  const cachedRTL = cache.get(locale);
  if (cachedRTL) return cachedRTL;
  let isRTL = !1;
  if (Intl.Locale) {
    const script = new Intl.Locale(locale).maximize().script;
    isRTL = rtlScripts.has(script);
  } else {
    const lang = locale.split("-")[0];
    isRTL = rtlLangs.has(lang);
  }
  return cache.set(locale, isRTL), isRTL;
}
export { isLocaleRTL };
//# sourceMappingURL=isLocaleRTL.mjs.map
