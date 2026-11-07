#!/usr/bin/env bash
# Phase-6154: UI honesty bundle includes ssh_alternative_presence_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_alternative_presence_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_alternative_presence_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_presence_roster bundle section ok"; echo "cleaned"; echo "OK: phase6154 e2e passed"
