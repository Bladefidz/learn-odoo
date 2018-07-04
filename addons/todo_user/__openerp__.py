# -*- coding: utf-8 -*-
{
    'name': "Multiuser To-Do",

    'summary': "Extend To-Do app with multi user task sharing.",

    'description': "Extend the To-Do app to multiuser",

    'author': "Bladefidz",
    'website': "http://bladefidz.github.io",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/master/openerp/addons/base/module/module_data.xml
    # for the full list
    'category': 'Uncategorized',
    'version': '0.1',

    # any module necessary for this one to work correctly
    'depends': ['todo_app'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        # 'views/views.xml',
        # 'views/templates.xml',
        'views/todo_view.xml'
    ],
    # only loaded in demonstration mode
    'demo': [
        'demo/demo.xml',
    ],
    'application': True,
    'installable': True
}