<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 15:26
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;

/**
 * Class IntFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class IntFieldValueEntity extends FieldValueEntity
{
    /**
     * @var int|null
     * @ORM\Column(type="integer", nullable=true)
     */
    private $value;

    public function __construct(IntFieldEntity $field, ?int $value = null)
    {
        parent::__construct($field);
        $this->value = $value;
    }

    /**
     * @return int|null
     */
    public function getValue(): ?int
    {
        return $this->value;
    }

    /**
     * @param int|null $value
     */
    public function setValue(?int $value): void
    {
        $this->value = $value;
    }

}
