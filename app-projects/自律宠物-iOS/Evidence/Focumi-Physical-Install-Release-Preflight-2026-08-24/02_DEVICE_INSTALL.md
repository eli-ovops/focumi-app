# Physical device install record

## Target verification

- Historical UDID was freshly confirmed: `00008150-0001095A360A401C`.
- Connected target: `XXXTENTACION`, iPhone 17 (`iPhone18,3`), iOS 27.0 (24A5408d).
- State at install: connected, paired, wired, booted, Developer Mode enabled, unlocked.
- It was the sole currently listed physical device matching the requested target.

## Install and launch

- Performed an in-place install of the freshly built Debug app; no uninstall or data erase was performed.
- Installed and queried app: `Focumi`, bundle `com.cczij.disciplinedpet`, version `0.6.0`, build `10`.
- Launched `com.cczij.disciplinedpet` after terminating only its existing process (if present). This does not erase app data.
- Captured after-launch screen: `physical-launch.png` (1206 x 2622).

## Automated visible evidence

- The launched app rendered the current Task Setup screen rather than failing at launch.
- The captured current Chinese UI shows 30 / 45 / 60 as `分钟`; the selected fourth option is displayed as `2 小时`.

This does not establish every interactive state or Apple-controlled system extension behavior.
