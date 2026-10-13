# test-kuber

Tiny k3s (via k3d) demo: a SQLite pod (Datasette) and a web pod (nginx + one HTML page) showing its data.

    make setup   # install k3d + kubectl to ~/.local/bin (once)
    make up      # create cluster, deploy both pods
    # open http://localhost:8080
    make down    # delete everything
