#!/usr/bin/env bash
# Phase-5514: UI honesty bundle includes ssh_refusal_path_titles_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_refusal_path_titles_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_refusal_path_titles_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_path_titles_roster bundle section ok"; echo "cleaned"; echo "OK: phase5514 e2e passed"
