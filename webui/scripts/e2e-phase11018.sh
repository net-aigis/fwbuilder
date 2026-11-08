#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthRefusalRelatedRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-refusal-related roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11018 e2e passed"
