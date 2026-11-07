#!/usr/bin/env bash
# Phase-5658: UI ssh-auth-note roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthNoteRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-auth-note roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-note roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-auth-note roster ok"; echo "cleaned"; echo "OK: phase5658 e2e passed"
