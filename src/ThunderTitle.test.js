import { render, screen } from '@testing-library/react';
import ThunderTitle from './ThunderTitle';

test('renders ThunderTitle component', () => {
  render(<ThunderTitle />);
  const titleElement = screen.getByText(/SkillCloud/i);
  expect(titleElement).toBeInTheDocument();
});