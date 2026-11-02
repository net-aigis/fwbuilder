import { useState } from "react";
import { createObject } from "../api/client";

type Props = {
  sessionId: string;
  parentId: string;
  parentName?: string;
  parentType?: string;
  busy?: boolean;
  onCreated: (id: string) => void;
  onBusy?: (busy: boolean) => void;
  onError?: (msg: string | null) => void;
  onStatus?: (msg: string) => void;
};

const BASE_TYPES = [
  "Network",
  "NetworkIPv6",
  "Host",
  "IPv4",
  "IPv6",
  "AddressRange",
  "DNSName",
  "AddressTable",
  "TCPService",
  "UDPService",
  "ICMPService",
  "ICMP6Service",
  "IPService",
  "TagService",
  "UserService",
  "CustomService",
  "Interval",
  "IntervalGroup",
  "ObjectGroup",
  "ServiceGroup",
];

export function CreateObject({
  sessionId,
  parentId,
  parentName,
  parentType,
  busy,
  onCreated,
  onBusy,
  onError,
  onStatus,
}: Props) {
  const hostLike = parentType === "Firewall" || parentType === "Host" || parentType === "Cluster";
  const ifaceLike = parentType === "Interface";
  const groupLike = parentType === "ObjectGroup" || parentType === "Library";
  const rootLike = parentType === "FWObjectDatabase";
  const TYPES = ifaceLike
    ? ["IPv4", "IPv6", "AttachedNetworks", ...BASE_TYPES]
    : hostLike
      ? ["Interface", "IPv4", "IPv6", "Policy", "NAT", "Routing", ...BASE_TYPES]
      : rootLike
        ? ["Library"]
        : groupLike
          ? ["Firewall", "Host", "Cluster", ...BASE_TYPES]
          : BASE_TYPES;
  const [type, setType] = useState(
    rootLike ? "Library" : hostLike ? "Interface" : groupLike ? "Firewall" : "Network",
  );
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [netmask, setNetmask] = useState("255.255.255.0");
  const [endAddress, setEndAddress] = useState("");
  const [dstPort, setDstPort] = useState("");
  const [dnsName, setDnsName] = useState("");
  const [runTime, setRunTime] = useState(true);
  const [filename, setFilename] = useState("");
  const [platform, setPlatform] = useState("nftables");
  const [hostOs, setHostOs] = useState("linux24");

  const isService = type === "TCPService" || type === "UDPService" || type === "TCPUDPService";
  const isRange = type === "AddressRange";
  const isDns = type === "DNSName";
  const isAddrTable = type === "AddressTable";
  const needsNetmask = type === "Network" || type === "IPv4" || type === "NetworkIPv6" || type === "IPv6";
  const isFwLike = type === "Firewall" || type === "Host" || type === "Cluster";
  const showAddress = !isDns && !isAddrTable && (isRange || needsNetmask || type === "Host");

  async function submit() {
    if (!name.trim()) {
      onError?.("name required");
      return;
    }
    onBusy?.(true);
    onError?.(null);
    try {
      const attrs: Record<string, string | number> = {};
      if (isRange) {
        if (address.trim()) attrs.start_address = address.trim();
        if (endAddress.trim()) attrs.end_address = endAddress.trim();
      } else if (isDns) {
        if (dnsName.trim()) attrs.dnsname = dnsName.trim();
        attrs.run_time = runTime ? "True" : "False";
      } else if (isAddrTable) {
        if (filename.trim()) attrs.filename = filename.trim();
        attrs.run_time = runTime ? "True" : "False";
      } else {
        if (address.trim()) attrs.address = address.trim();
        if (netmask.trim() && needsNetmask) attrs.netmask = netmask.trim();
      }
      if (isService && dstPort.trim()) {
        attrs.dst_range_start = dstPort.trim();
        attrs.dst_range_end = dstPort.trim();
      }
      if (isFwLike) {
        if (platform.trim()) attrs.platform = platform.trim();
        if (hostOs.trim()) attrs.host_OS = hostOs.trim();
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
      setEndAddress("");
      setDstPort("");
      setDnsName("");
      setFilename("");
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
        {isDns ? (
          <label className="field block">
            DNS name
            <input value={dnsName} disabled={busy} onChange={(e) => setDnsName(e.target.value)} />
          </label>
        ) : null}
        {isAddrTable ? (
          <label className="field block">
            Filename
            <input value={filename} disabled={busy} onChange={(e) => setFilename(e.target.value)} />
          </label>
        ) : null}
        {isDns || isAddrTable ? (
          <label className="field block inline">
            <input
              type="checkbox"
              checked={runTime}
              disabled={busy}
              onChange={(e) => setRunTime(e.target.checked)}
            />{" "}
            Resolve at run time
          </label>
        ) : null}
        {showAddress ? (
          <label className="field block">
            {isRange ? "Start address" : "Address"}
            <input value={address} disabled={busy} onChange={(e) => setAddress(e.target.value)} />
          </label>
        ) : null}
        {isRange ? (
          <label className="field block">
            End address
            <input value={endAddress} disabled={busy} onChange={(e) => setEndAddress(e.target.value)} />
          </label>
        ) : null}
        {needsNetmask ? (
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
        {isFwLike ? (
          <>
            <label className="field block">
              Platform
              <input value={platform} disabled={busy} onChange={(e) => setPlatform(e.target.value)} />
            </label>
            <label className="field block">
              Host OS
              <input value={hostOs} disabled={busy} onChange={(e) => setHostOs(e.target.value)} />
            </label>
          </>
        ) : null}
      </div>
      <button type="button" disabled={busy} onClick={() => void submit()}>
        Create
      </button>
    </div>
  );
}
