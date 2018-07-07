cd odoo
git checkout 9.0

cd ..
python2 odoo/odoo.py --dev --addons-path="custom-addons,odoo/addons" --log-level=debug
