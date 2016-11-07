function val = auto_core(time_func_in, pos_in, sample_length_in, delta_t_in)
  val = 0;
  for i = (pos_in:pos_in + sample_length_in - delta_t_in)
    val = val + time_func_in(i)*time_func_in(i+delta_t_in);
    %disp(time_func_in(i)*time_func_in(i+delta_t_in))
  end
  val = val / (sample_length_in - delta_t_in);
end