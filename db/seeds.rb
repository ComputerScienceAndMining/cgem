# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Clean tables
Parameter.delete_all
LabTest.delete_all
TestType.delete_all
TestStatus.delete_all
Specimen.delete_all
SpecimenType.delete_all
Sample.delete_all
SampleType.delete_all
WorkOrder.delete_all
WorkOrderStatus.delete_all
User.delete_all
Organisation.delete_all

# Reset postgres auto increments
Organisation.connection.execute('ALTER SEQUENCE organisations_id_seq RESTART WITH 1')
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
Parameter.connection.execute('ALTER SEQUENCE parameters_id_seq RESTART WITH 1')
WorkOrderStatus.connection.execute('ALTER SEQUENCE work_order_statuses_id_seq RESTART WITH 1')
WorkOrder.connection.execute('ALTER SEQUENCE work_orders_id_seq RESTART WITH 1')
SampleType.connection.execute('ALTER SEQUENCE sample_types_id_seq RESTART WITH 1')
Sample.connection.execute('ALTER SEQUENCE samples_id_seq RESTART WITH 1')
SpecimenType.connection.execute('ALTER SEQUENCE specimen_types_id_seq RESTART WITH 1')
Specimen.connection.execute('ALTER SEQUENCE specimens_id_seq RESTART WITH 1')
TestStatus.connection.execute('ALTER SEQUENCE test_statuses_id_seq RESTART WITH 1')
TestType.connection.execute('ALTER SEQUENCE test_types_id_seq RESTART WITH 1')
LabTest.connection.execute('ALTER SEQUENCE lab_tests_id_seq RESTART WITH 1')

# Organisations
usach = Organisation.create! name: 'Universidad de Santiago de Chile'
teniente = Organisation.create! name: 'Teniente'

# Users
user_1 = User.create! first_name: 'Danilo', last_name: 'Aburto', email:'danilo.aburto@usach.cl', password: 'danilo123', password_confirmation:'danilo123', role: 0, enabled: true

# Work Order statuses
wos_creada = WorkOrderStatus.create! name: 'Creada'
WorkOrderStatus.create! name: 'En progreso'
WorkOrderStatus.create! name: 'Finalizada'
WorkOrderStatus.create! name: 'Entregada'

# Work orders
wo_1 = WorkOrder.create! name: 'Pruebas Sondajes Sector Sur Teniente', description: '', due_date: '2017-10-10', responsible_id: user_1.id, work_order_status: wos_creada, organisation: teniente

# SampleType type
testigo = SampleType.create! name: 'Testigo', data: {
  'fields': [
    {
      'name': 'Pozo',
      'type': 'text',
      'mandatory': false,
    },
    {
      'name': 'Caja',
      'type': 'text',
      'mandatory': false,
    },
    {
      'name': 'Profundidad [m]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Largo [m]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Porcentaje de recuperación [m]',
      'type': 'number',
      'mandatory': false,
    },
    {
      'name': 'Fecha de recepción',
      'type': 'date',
      'mandatory': true,
    },
    {
      'name': 'Protección de muestra',
      'type': 'radio',
      'mandatory': true,
      'alternatives': [
        {'name': 'Cuidado de rutina'},
        {'name': 'Cuidado especial'},
        {'name': 'Cuidado crítico'}
      ]
    },
  ]
}

probeta = SpecimenType.create! name: 'Probeta'
disco = SpecimenType.create! name: 'Disco'
bloque = SpecimenType.create! name: 'Bloque'

samples = []
(1..30).each do |num|
  new_sample = Sample.create! code: "T1-S#{num}", remarks: 'Sin observaciones', sample_type: testigo, sample_type_version: nil, work_order: wo_1, data: nil
  samples.append new_sample
end

# Se crean especímenes
specimens = []
samples.each do |sample|
  (1..4).each do |num|
    new_specimen = Specimen.create! code: "#{sample.code}-S#{num}", remarks: 'Sin observaciones', sample: sample, specimen_type: probeta, specimen_type_version: nil, prepared_by: user_1, data: nil
    specimens.append new_specimen
  end
end

# Status de ensayos
ts_creado = TestStatus.create! name: 'Creado'
ts_progreso = TestStatus.create! name: 'En progreso'
ts_finalizado = TestStatus.create! name: 'Finalizado'

# Test Types
tt_ucs = TestType.create! name: 'UCS', description: '', data: nil
tt_cd = TestType.create! name: 'Coeficientes dinámicos', description: '', data: nil
tt_d = TestType.create! name: 'Densidad', description: '', data: nil

# Se crean ensayos
lab_tests = []
specimens.each do |specimen|
  new_test_1 = LabTest.create! started_at: '2017-8-10 10:12:00.000000', ended_at: '2017-8-10 11:12:00.000000', work_order: wo_1, test_status: ts_finalizado, test_type: tt_cd, specimen: specimen, tested_by: user_1, data: nil
  new_test_1 = LabTest.create! started_at: '2017-8-10 10:12:00.000000', ended_at: '2017-8-10 11:12:00.000000', work_order: wo_1, test_status: ts_finalizado, test_type: tt_d, specimen: specimen, tested_by: user_1, data: nil
  new_test_1 = LabTest.create! started_at: '2017-8-10 10:12:00.000000', ended_at: nil, work_order: wo_1, test_status: ts_creado, test_type: tt_ucs, specimen: specimen, tested_by: user_1, data: nil
end
