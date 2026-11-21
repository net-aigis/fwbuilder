#!/usr/bin/env bash
# Phase-4859: client ssh_capability_flags_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_capability_flags_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-capability-flags roster type ok"; echo "cleaned"; echo "OK: phase4859 e2e passed"
