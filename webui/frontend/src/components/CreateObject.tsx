import { useState } from "react";
import { createObject } from "../api/client";

type Props = {
  sessionId: string;
  parentId: string;
  parentName?: string;
  busy?: boolean;
  onCreated: (id: string) => void;
  onBusy?: (busy: boolean) => void;
  onError?: (msg: string | null) => void;
  onStatus?: (msg: string) => void;
};

const TYPES = [
  "Network",
  "Host",
  "IPv4",
  "AddressRange",
  "DNSName",
  "TCPService",
  "UDPService",
  "ICMPService",
  "IPService",
  "ObjectGroup",
  "ServiceGroup",
];

export function CreateObject({
  sessionId,
  parentId,
  parentName,
  busy,
  onCreated,
  onBusy,
  onError,
  onStatus,
}: Props) {
  const [type, setType] = useState("Network");
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [netmask, setNetmask] = useState("255.255.255.0");
  const [dstPort, setDstPort] = useState("");

  const isService = type === "TCPService" || type === "UDPService" || type === "TCPUDPService";

  async function submit() {
    if (!name.trim()) {
      onError?.("name required");
      return;
    }
    onBusy?.(true);
    onError?.(null);
    try {
      const attrs: Record<string, string | number> = {};
      if (address.trim()) attrs.address = address.trim();
      if (netmask.trim() && (type === "Network" || type === "IPv4")) attrs.netmask = netmask.trim();
      if (isService && dstPort.trim()) {
        attrs.dst_range_start = dstPort.trim();
        attrs.dst_range_end = dstPort.trim();
      }
      const obj = await createObject(sessionId, {
        parent_id: parentId,
        type,
        name: name.trim(),
        attrs: Object.keys(attrs).length ? attrs : undefined,
      });
      onStatus?.(`Created ${obj.type} ${obj.name}`);
      setName("");
      setAddress("");
      setDstPort("");
      onCreated(obj.id);
    } catch (err) {
      onError?.(err instanceof Error ? err.message : String(err));
    } finally {
      onBusy?.(false);
    }
  }

  return (
    <div className="create-object">
      <header className="panel-header">
        <h3>Create under {parentName || parentId}</h3>
      </header>
      <div className="typed-grid">
        <label className="field block">
          Type
          <select value={type} disabled={busy} onChange={(e) => setType(e.target.value)}>
            {TYPES.map((t) => (
              <option key={t} value={t}>
                {t}
              </option>
            ))}
          </select>
        </label>
        <label className="field block">
          Name
          <input value={name} disabled={busy} onChange={(e) => setName(e.target.value)} />
        </label>
        <label className="field block">
          Address
          <input value={address} disabled={busy} onChange={(e) => setAddress(e.target.value)} />
        </label>
        {type === "Network" || type === "IPv4" ? (
          <label className="field block">
            Netmask
            <input value={netmask} disabled={busy} onChange={(e) => setNetmask(e.target.value)} />
          </label>
        ) : null}
        {isService ? (
          <label className="field block">
            Destination port
            <input value={dstPort} disabled={busy} onChange={(e) => setDstPort(e.target.value)} />
          </label>
        ) : null}
      </div>
      <button type="button" disabled={busy} onClick={() => void submit()}>
        Create
      </button>
    </div>
  );
}
