pgsql2shp -f block_ak -h localhost -p 54321 fccgis carto.block_ak
pgsql2shp -f block_al -h localhost -p 54321 fccgis carto.block_al
pgsql2shp -f block_az -h localhost -p 54321 fccgis carto.block_az
pgsql2shp -f block_ar -h localhost -p 54321 fccgis carto.block_ar
pgsql2shp -f block_ca -h localhost -p 54321 fccgis carto.block_ca
pgsql2shp -f block_co -h localhost -p 54321 fccgis carto.block_co
pgsql2shp -f block_ct -h localhost -p 54321 fccgis carto.block_ct
pgsql2shp -f block_de -h localhost -p 54321 fccgis carto.block_de
pgsql2shp -f block_dc -h localhost -p 54321 fccgis carto.block_dc
pgsql2shp -f block_fl -h localhost -p 54321 fccgis carto.block_fl
pgsql2shp -f block_ga -h localhost -p 54321 fccgis carto.block_ga
pgsql2shp -f block_hi -h localhost -p 54321 fccgis carto.block_hi
pgsql2shp -f block_id -h localhost -p 54321 fccgis carto.block_id
pgsql2shp -f block_il -h localhost -p 54321 fccgis carto.block_il
pgsql2shp -f block_in -h localhost -p 54321 fccgis carto.block_in
pgsql2shp -f block_ia -h localhost -p 54321 fccgis carto.block_ia
pgsql2shp -f block_ks -h localhost -p 54321 fccgis carto.block_ks
pgsql2shp -f block_ky -h localhost -p 54321 fccgis carto.block_ky
pgsql2shp -f block_la -h localhost -p 54321 fccgis carto.block_la
pgsql2shp -f block_me -h localhost -p 54321 fccgis carto.block_me
pgsql2shp -f block_md -h localhost -p 54321 fccgis carto.block_md
pgsql2shp -f block_ma -h localhost -p 54321 fccgis carto.block_ma
pgsql2shp -f block_mi -h localhost -p 54321 fccgis carto.block_mi
pgsql2shp -f block_mn -h localhost -p 54321 fccgis carto.block_mn
pgsql2shp -f block_ms -h localhost -p 54321 fccgis carto.block_ms
pgsql2shp -f block_mo -h localhost -p 54321 fccgis carto.block_mo
pgsql2shp -f block_mt -h localhost -p 54321 fccgis carto.block_mt
pgsql2shp -f block_ne -h localhost -p 54321 fccgis carto.block_ne
pgsql2shp -f block_nv -h localhost -p 54321 fccgis carto.block_nv
pgsql2shp -f block_nh -h localhost -p 54321 fccgis carto.block_nh
pgsql2shp -f block_nj -h localhost -p 54321 fccgis carto.block_nj
pgsql2shp -f block_nm -h localhost -p 54321 fccgis carto.block_nm
pgsql2shp -f block_ny -h localhost -p 54321 fccgis carto.block_ny
pgsql2shp -f block_nc -h localhost -p 54321 fccgis carto.block_nc
pgsql2shp -f block_nd -h localhost -p 54321 fccgis carto.block_nd
pgsql2shp -f block_oh -h localhost -p 54321 fccgis carto.block_oh
pgsql2shp -f block_ok -h localhost -p 54321 fccgis carto.block_ok
pgsql2shp -f block_or -h localhost -p 54321 fccgis carto.block_or
pgsql2shp -f block_pa -h localhost -p 54321 fccgis carto.block_pa
pgsql2shp -f block_ri -h localhost -p 54321 fccgis carto.block_ri
pgsql2shp -f block_sc -h localhost -p 54321 fccgis carto.block_sc
pgsql2shp -f block_sd -h localhost -p 54321 fccgis carto.block_sd
pgsql2shp -f block_tn -h localhost -p 54321 fccgis carto.block_tn
pgsql2shp -f block_tx -h localhost -p 54321 fccgis carto.block_tx
pgsql2shp -f block_ut -h localhost -p 54321 fccgis carto.block_ut
pgsql2shp -f block_vt -h localhost -p 54321 fccgis carto.block_vt
pgsql2shp -f block_va -h localhost -p 54321 fccgis carto.block_va
pgsql2shp -f block_wa -h localhost -p 54321 fccgis carto.block_wa
pgsql2shp -f block_wv -h localhost -p 54321 fccgis carto.block_wv
pgsql2shp -f block_wi -h localhost -p 54321 fccgis carto.block_wi
pgsql2shp -f block_wy -h localhost -p 54321 fccgis carto.block_wy
pgsql2shp -f block_as -h localhost -p 54321 fccgis carto.block_as
pgsql2shp -f block_gu -h localhost -p 54321 fccgis carto.block_gu
pgsql2shp -f block_mp -h localhost -p 54321 fccgis carto.block_mp
pgsql2shp -f block_pr -h localhost -p 54321 fccgis carto.block_pr
pgsql2shp -f block_vi -h localhost -p 54321 fccgis carto.block_vi
rm block_2010.sqlite
ogr2ogr -f "SQLite" block_2010.sqlite block_ak.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_al.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_az.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ar.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ca.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_co.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ct.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_de.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_dc.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_fl.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ga.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_hi.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_id.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_il.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_in.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ia.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ks.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ky.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_la.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_me.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_md.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ma.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_mi.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_mn.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ms.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_mo.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_mt.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ne.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nv.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nh.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nj.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nm.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ny.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nc.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_nd.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_oh.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ok.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_or.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_pa.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ri.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_sc.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_sd.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_tn.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_tx.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_ut.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_vt.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_va.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_wa.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_wv.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_wi.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_wy.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_as.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_gu.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_mp.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_pr.shp
ogr2ogr -f "SQLite" -update block_2010.sqlite block_vi.shp

rm *.shp
rm *.shx
rm *.dbf
rm *.prj

