---
title: esclient
date: 2020-03-07
categories: ['elasticsearch']
draft: false
---

```
public ElasticsearchClient(final String[] addresses, final String clusterName) {
  // create default settings and add cluster name
  Settings.Builder settings = Settings.builder()
      .put("cluster.name", clusterName)
      .put("cluster.routing.allocation.enable", "all")
      .put("cluster.routing.allocation.allow_rebalance", "true");
  // create a client
  TransportClient tc = TransportClient.builder()
      .settings(settings.build())
      .build();
  for (String address: addresses) {
    String a = address.trim();
    int p = a.indexOf(':');
    if (p >= 0) try {
      InetAddress i = InetAddress.getByName(a.substring(0, p));
      int port = Integer.parseInt(a.substring(p + 1));
      tc.addTransportAddress(new InetSocketTransportAddress(i, port));
    } catch (UnknownHostException e) {
      DAO.severe(e);
    }
  }
  this.elasticsearchClient = tc;
}

```