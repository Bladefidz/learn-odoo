# -*- coding: utf-8 -*-
from openerp import models, fields, api

class TodoTask(models.Model):
	"""docstring for TodoTask"""
	_name = 'todo.task'
	_description = 'To-do Task'
	name = fields.Char('Description', required=True)
	is_done = fields.Boolean('Done?')
	active = fields.Boolean('Active?', default=True)

	@api.one
	def do_toggle_done(self):
		self.is_done = not self.is_done
		return True

	@api.multi
	def do_clear_done(self):
		dones = self.search([('is_done', '=', True)])
		dones.write({'active': False})
		return True