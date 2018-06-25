# -*- coding: utf-8 -*-
{
    'name': "To-Do Application",

    'summary': "Manage your personal To-Do tasks.",

    'description': "A demo of working odoo add-on to manage user's to-do list and task.",

    'author': "Bladefidz",
    'website': "http://bladefidz.github.io",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/master/openerp/addons/base/module/module_data.xml
    # for the full list
    'category': 'Uncategorized',
    'version': '0.1',

    # any module necessary for this one to work correctly
    'depends': ['mail'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        'views/views.xml',
        'views/templates.xml',
    ],
    # only loaded in demonstration mode
    'demo': [
        'demo/demo.xml',
    ],

    'application': true
}