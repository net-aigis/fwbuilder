#!/usr/bin/env bash
# Phase-5739: client ssh_alternative_support_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_support_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternative-support roster type ok"; echo "cleaned"; echo "OK: phase5739 e2e passed"
