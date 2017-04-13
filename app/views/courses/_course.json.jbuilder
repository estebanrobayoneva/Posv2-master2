json.extract! course, :id, :nombre, :numero_sesiones, :valor_sesion, :valor_total_curso, :created_at, :updated_at
json.url course_url(course, format: :json)
