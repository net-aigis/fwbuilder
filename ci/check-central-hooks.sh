#!/usr/bin/env bash
# Verify central prolog/epilog hooks against a built fwb_ipt binary.
# Skips cleanly when the compiler is not present so the script can ship
# before a full matrix job is attached.
set -euo pipefail

if (( $# < 2 )); then
    echo "Usage: $0 FWB_IPT BASELINE.fwb [OUTPUT_DIR]" >&2
    exit 2
fi

compiler=$1
baseline=$2
outdir=${3:-/tmp/fwb-central-hooks-out}
mkdir -p "$outdir"
outdir=$(cd "$outdir" && pwd -P)

if [[ ! -x "$compiler" ]]; then
    echo "SKIP: compiler not executable: $compiler"
    exit 0
fi
if [[ ! -s "$baseline" ]]; then
    echo "Missing baseline project: $baseline" >&2
    exit 2
fi

hooks=$(mktemp -d "$outdir/hooks.XXXXXX")
trap 'rm -rf "$hooks"' EXIT

mkdir -p "$hooks/prolog.d" "$hooks/epilog.d" \
         "$hooks/platforms/iptables/prolog.d" \
         "$hooks/profiles/opensuse-leap-15.6/prolog.d"

printf '%s\n' 'echo central-global-prolog' > "$hooks/prolog.d/10-common.sh"
printf '%s\n' 'echo central-platform-prolog' > "$hooks/platforms/iptables/prolog.d/20-platform.sh"
printf '%s\n' 'echo central-profile-prolog' > "$hooks/profiles/opensuse-leap-15.6/prolog.d/30-profile.sh"
printf '%s\n' 'echo central-global-epilog' > "$hooks/epilog.d/90-finish.sh"
printf '%s\n' '# comment only' > "$hooks/prolog.d/README.md"

export FWBUILDER_HOOKS_DIR="$hooks"

# Find an iptables firewall name inside the baseline if present.
fw_name=$(python3 - "$baseline" <<'PY'
import sys, xml.etree.ElementTree as ET
root = ET.parse(sys.argv[1]).getroot()
ns = ''
if root.tag.startswith('{'):
    ns = root.tag.split('}')[0] + '}'
for fw in root.iter(ns + 'Firewall'):
    if fw.get('platform') == 'iptables' and fw.get('inactive', 'False') == 'False':
        print(fw.get('name'))
        break
else:
    sys.exit(3)
PY
) || {
    echo "SKIP: no iptables firewall object in baseline"
    exit 0
}

printf '%s\n' "$fw_name opensuse-leap-15.6" > "$hooks/profiles.map"

work="$outdir/compile-$fw_name"
rm -rf "$work"
mkdir -p "$work"

if ! "$compiler" -f "$baseline" -d "$work" "$fw_name" > "$work/compile.log" 2>&1; then
    cat "$work/compile.log" >&2
    echo "FAIL: compiler rejected $fw_name with hooks enabled" >&2
    exit 1
fi

shopt -s nullglob
generated=("$work"/*.fw)
shopt -u nullglob
if (( ${#generated[@]} != 1 )); then
    echo "FAIL: expected one generated script" >&2
    exit 1
fi
script=${generated[0]}

for needle in \
    'echo central-global-prolog' \
    'echo central-platform-prolog' \
    'echo central-profile-prolog' \
    'echo central-global-epilog' \
    'begin fwbuilder central hook: prolog.d/10-common.sh' \
    'begin fwbuilder central hook: platforms/iptables/prolog.d/20-platform.sh'
do
    grep -Fq "$needle" "$script" || {
        echo "FAIL: missing hook output: $needle" >&2
        exit 1
    }
done

# Order: global before platform before profile.
python3 - "$script" <<'PY'
from pathlib import Path
import sys
text = Path(sys.argv[1]).read_text()
markers = [
    'echo central-global-prolog',
    'echo central-platform-prolog',
    'echo central-profile-prolog',
    'echo central-global-epilog',
]
positions = [text.index(m) for m in markers]
if positions != sorted(positions):
    raise SystemExit('FAIL: hook order is not global, platform, profile, epilog')
print('PASS: hook order')
PY

# Unreadable file must fail the compile.
chmod a-r "$hooks/prolog.d/10-common.sh"
fail_dir="$outdir/compile-unreadable"
rm -rf "$fail_dir"
mkdir -p "$fail_dir"
if "$compiler" -f "$baseline" -d "$fail_dir" "$fw_name" > "$fail_dir/compile.log" 2>&1; then
    echo "FAIL: unreadable hook file was accepted" >&2
    exit 1
fi
grep -Fq 'not readable' "$fail_dir/compile.log" || \
grep -Fq 'Cannot read central hooks file' "$fail_dir/compile.log" || {
    cat "$fail_dir/compile.log" >&2
    echo "FAIL: unreadable hook did not report a clear error" >&2
    exit 1
}
chmod a+r "$hooks/prolog.d/10-common.sh"

# No hooks configured → historical output must not contain central markers.
unset FWBUILDER_HOOKS_DIR
clean="$outdir/compile-clean"
rm -rf "$clean"
mkdir -p "$clean"
"$compiler" -f "$baseline" -d "$clean" "$fw_name" > "$clean/compile.log" 2>&1
clean_script=("$clean"/*.fw)
if grep -Fq 'begin fwbuilder central hook:' "${clean_script[0]}"; then
    echo "FAIL: central hooks appeared without configuration" >&2
    exit 1
fi

echo "PASS: central hooks ($fw_name)"
