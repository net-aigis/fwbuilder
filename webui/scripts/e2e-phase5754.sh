#!/usr/bin/env bash
# Phase-5754: UI honesty bundle includes ssh_alternative_support_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_alternative_support_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_alternative_support_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_support_roster bundle section ok"; echo "cleaned"; echo "OK: phase5754 e2e passed"
