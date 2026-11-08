#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthGapRefusalTitleRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-gap-refusal-title roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14058 e2e passed"
