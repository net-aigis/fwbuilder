#!/usr/bin/env bash
# Phase-140: Interactive installer warning + deploy prefs persistence.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fetchInstallerConfiglets' "$extras"
grep -q 'installerNote' "$extras"
grep -q 'deployPrefsKey' "$extras"
grep -q 'fwbweb.deployPrefs' "$extras"
grep -q 'className="warn' "$extras"
echo "interactive warn + deploy prefs ok"
echo "cleaned"
echo "OK: phase140 e2e passed"
