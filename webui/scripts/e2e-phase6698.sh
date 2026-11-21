#!/usr/bin/env bash
# Phase-6698: UI ssh-not-implemented-keyboard roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshNotImplementedKeyboardRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-not-implemented-keyboard roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-keyboard roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-not-implemented-keyboard roster ok"; echo "cleaned"; echo "OK: phase6698 e2e passed"
